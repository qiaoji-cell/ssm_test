//获取上下文路径
function getContextPath(){
    let pathName = document.location.pathname;
    let index = pathName.substr(1).indexOf("/");
    let result = pathName.substr(0,index+1);
    return result;
}