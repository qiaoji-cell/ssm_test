/**
 * 工具类
 * 1.通用 tableRender(idElem,url,headTool,cols) 表格渲染工具 指定表格的id、api路径、头部工具栏的id、添加弹出层的尺寸 例子：['800px','600px'][√]
 * 2.通用 query(formFilter,tableId) 表格连带表单的条件保留刷新工具 指定表格id、表单filter[√]
 * 3.通用 tableHeadEvent(tableFilterName,alertType,alertTitle,areaSize,contentUrl,delPostUrl) 表格头事件工具 lay-event为 add 和 del  删除事件 [√]
 * 4.通用 tableRowEvent(tableFilterName,alertType,alertTitle,areaSize,contentUrl,delPostUrl,updateCallBack) 表格行事件工具 编辑和删除单个[√]
 * 5.通用 formQuery(formFilter,tableId,submitFilter) 表单条件查询工具 指定表单名称、表格的id、按钮的lay-filter 进行绑定提交按钮[√]
 * 6.通用 formSubmit(submitFilter,formFilter,postUrl) 表单提交工具 指定提交的表单filter,按钮的filter,提交路径 post提交[√]
 * 7.iframe layEventClose(eventName) 监听单击 关闭按钮工具 lay-event=close[√]
 * 8.iframe submitAndClose(submitFilter,formFilter,postUrl) 表单提交并关闭窗口工具 iframe方能使用 指定提交的表单filter,按钮的filter,提交路径 post提交 自动关闭iframe弹层[√]
 * 9.通用 layEvent(eventName,callBack) 监听单击 关按钮工具 lay-event=自定义的[√]
 */

layui.define(['jquery', 'form', 'table', 'layer'], function (exports) {
    let $ = layui.jquery,
        form = layui.form,
        table = layui.table,
        layer = layui.layer;

    let utils = {
        /**
         * 表单条件查询
         * @param formFilter 表单的filter名称
         * @param tableId 表格的filter名称
         * @param submitFilter 提交按钮的filter名称
         */
        formQuery: function formQuery(formFilter, tableId, submitFilter) {
            function query(formFilter, tableId) {
                let where = form.val(formFilter);
                table.reload(tableId, {where})
            }
            form.on('submit(' + submitFilter + ')', function () {
                query(formFilter, tableId);
            })
        },
        /**
         * 表格连带表单的条件重新查询
         * @param formFilter 表单的filter名称
         * @param tableId 表格id
         */
        query: function query(formFilter, tableId) {
            let where = form.val(formFilter);
            table.reload(tableId, {where})
        },
        /**
         * 打开添加弹窗
         * @param windowType 弹窗类型
         * @param title 弹窗标题
         * @param areaSize 弹窗尺寸 例子 ['800px','600px']
         * @param contentUrl 接口api访问url
         */
        openAddWindow: function openAddWindow(formFilter, tableId, alertType, title, areaSize, contentUrl) {
            layer.open({
                type: alertType,
                title: title,
                shadeClose: "true",
                move: false,
                area: areaSize,
                content: contentUrl,
                end: function () {
                    //重载表格
                    function query(formFilter, tableId) {
                        let where = form.val(formFilter);
                        table.reload(tableId, {where})
                    }
                    query(formFilter, tableId);
                }
            })
        },
        /**
         * 表格头部添加和批量删除事件
         * @param tableFilterName 表格filter名称
         * @param alertType 添加弹窗类型
         * @param alertTitle 添加弹窗标题
         * @param areaSize 弹窗的尺寸 例子 ['800px','600px']
         * @param contentUrl 弹窗打开的路径
         * @param delPostUrl 表格删除请求的路径
         */
        tableHeadEvent: function tableHeadEvent(formFilter, tableId, tableFilterName, alertType, alertTitle, areaSize, contentUrl, delPostUrl) {
            table.on("toolbar(" + tableFilterName + ")", function (obj) {
                let checkStatus = table.checkStatus(obj.config.id);

                switch (obj.event) {
                    case 'add':
                    function openAddWindow(formFilter, tableId, alertType, title, areaSize, contentUrl) {
                        layer.open({
                            type: alertType,
                            title: title,
                            shadeClose: "true",
                            move: false,
                            area: areaSize,
                            content: contentUrl,
                            end: function () {
                                function query(formFilter, tableId) {
                                    let where = form.val(formFilter);
                                    table.reload(tableId, {where})
                                }
                                //重载表格
                                query(formFilter, tableId);
                            }
                        })
                    };
                        openAddWindow(formFilter, tableId, alertType, alertTitle, areaSize, contentUrl);
                        break;
                    case 'del':
                        let data = checkStatus.data;
                        let ids = data.map(d => 'ids=' + d.id).join('&');
                        if (data.length <= 0) {
                            return layer.msg("请勾选一行数据")
                        }
                        $.post(contentUrl, ids)
                            .done((res) => {
                                //如果不是错误的code 就刷新表格
                                if (res.code != 3001) {
                                    function query(formFilter, tableId) {
                                        let where = form.val(formFilter);
                                        table.reload(tableId, {where})
                                    }
                                    query(formFilter,tableId);
                                }
                                layer.msg(res.msg);
                            })
                        break;
                }
            })

        },
        /**
         * 打开编辑窗口
         * @param data 表格行的数据
         * @param alertType 弹窗的类型
         * @param alertTitle 弹窗标题
         * @param areaSize 弹窗尺寸
         * @param contentUrl api的访问路径
         * @param updateCallBack 如果不是type2 的话不能用 编辑的回调 只作显示的话 改成只显示文本的元素 或者 禁用的表单元素
         */
        openUpdateWindow: function openUpdateWindow(formFilter,tableId,data,alertType, alertTitle, areaSize, contentUrl, updateCallBack) {
            layer.open({
                type: alertType,
                title: alertTitle,
                shadeClose: "true",
                move: false,
                resize: false,
                area: areaSize,
                content: contentUrl,
                success: function (layero, index) {
                    updateCallBack(layero, index)
                },
                end: function () {
                    //重载
                    function query(formFilter, tableId) {
                        let where = form.val(formFilter);
                        table.reload(tableId, {where})
                    }
                    query(formFilter,tableId);
                }
            })
        },
        /**
         * 表单提交并关闭iframe层 必须是iframe层 否则不能用
         * @param submitFilter 提交按钮的filter名称
         * @param formFilter 表单的filter名称
         * @param postUrl post提交的访问路径
         */
        submitAndClose: function submitAndClose(submitFilter, formFilter, postUrl) {
            form.on('submit(' + submitFilter + ')', function () {
                let param = form.val('addForm');
                $.post('/base/assert/edit', param)
                    .done((result) => {
                        if (result.code != 3001) {
                            layer.msg(result.msg, {time: 1000}, function () {
                                let parentIndex = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(parentIndex)
                            })
                        } else {
                            layer.msg(result.msg)
                        }
                    })
                return false;
            })
        },
        /**
         * 表格行工具事件
         * @param tableFilterName 表格filter名称
         * @param alertType 弹窗类型
         * @param alertTitle 弹窗标题
         * @param areaSize 弹窗尺寸
         * @param contentUrl 访问url
         * @param delPostUrl 删除单个行的url 删除的controller参数必须是 Long[] ids 或 Integer[] ids
         * @param updateCallBack 编辑行的回调  不过不是type2 的话不能用 用来显示打开的数据 例子：
         body.find('[name=id]').val(data.id);
         body.find('[name=gardenCode]').val(data.gardenCode);
         body.find('[name=gardenName]').val(data.gardenName);
         body.find('[name=parentOrg]').val(data.gardenPrincipal);
         body.find('[name=phone]').val(data.phone);
         body.find('[name=fax]').val(data.fax);
         body.find('[name=prefixSuffix]').val(data.prefixSuffix);
         body.find('[name=remark]').val(data.remark);
         */
        tableRowEvent: function tableRowEvent(tableFilterName, alertType, alertTitle, areaSize, contentUrl, delPostUrl, updateCallBack) {
            table.on("tool(" + tableFilterName + ")", function (obj) {
                let data = obj.data;
                function openUpdateWindow(data, alertType, alertTitle, areaSize, contentUrl, updateCallBack) {
                    layer.open({
                        type: alertType,
                        title: alertTitle,
                        shadeClose: "true",
                        move: false,
                        resize: false,
                        area: areaSize,
                        content: contentUrl,
                        success: function (layero, index) {
                            updateCallBack(layero, index)
                        },
                        end: function () {
                            function query(formFilter, tableId) {
                                let where = form.val(formFilter);
                                table.reload(tableId, {where})
                            }
                            //重载
                            query();
                        }
                    })
                }

                switch (obj.event) {
                    case 'edit':
                        openUpdateWindow(data, alertType, alertTitle, areaSize, contentUrl, updateCallBack);
                        break;
                    case 'del':
                        layer.confirm('确定要删除么', {
                            btn: ['是的', '再想想'],
                            yes(index, layero) {
                                $.post(delPostUrl, "ids=" + data.id)
                                    .done((res) => {
                                        //如果不是错误的code 就刷新表格
                                        if (res.code != 3001) {
                                            function query(formFilter, tableId) {
                                                let where = form.val(formFilter);
                                                table.reload(tableId, {where})
                                            }
                                            query();
                                        }
                                        layer.msg(res.msg);
                                    })
                            }
                        })
                        break;
                    case 'detail':
                        openUpdateWindow(data, alertType, alertTitle, areaSize, contentUrl, updateCallBack);
                }
            })
        },
        /**
         * 监听layEvent点击关闭事件
         * @param eventName lay-event的name 只能在打开的iframe页面内使用
         */
        layEventClose: function layEventClose(eventName) {
            util.event('lay-event', {
                'close': function (othis) {
                    let parentIndex = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(parentIndex)
                }
            })
        },
        /**
         * 监听lay-event点击事件
         * @param eventName lay-event名称
         * @param callBack 点击的操作 function()
         */
        layEvent: function layEvent(eventName, callBack) {
            util.event('lay-event', {
                eventName: function (othis) {
                    callBack(othis);
                }
            })
        },
        /**
         * 表单post提交事件 不管增删该等 效果是 错误弹出result的msg
         * @param submitFilter 提交按钮的filter名称
         * @param formFilter 表单的filter名称
         * @param postUrl post提交的访问路径
         */
        formSubmit: function formSubmit(submitFilter, formFilter, postUrl) {
            form.on('submit(' + submitFilter + ')', function () {
                let param = form.val(formFilter);
                $.post(postUrl, param)
                    .done((result) => {
                        layer.msg(result.msg)
                    })
                return false;
            })
        }
    }


    exports('utils', utils)
})

