"use strict";

//ibs - search block
//ibh - hamburger-menu block
//btnsearch - btn
//btnsearch2
//btnham - btn
//hamclose - close hamburger

document.addEventListener("click", clManage);

function clManage(event){
    console.log("123");
    var targ=event.target;

    while(targ!=document.body)
    {
        if(targ.parentNode.classList.contains("input-gr")) return;

        else if(targ==document.getElementById("btnsearch") || targ==ibs || targ==document.getElementById("btnsearch2")){
            hide(ibs);
            break;
        }
        else if(targ==document.getElementById("btnham") || targ==document.getElementById("hamclose")){
            hide(ibh);
            break;
        }
        targ=targ.parentNode;
    }
}

function hide(el){
    el.classList.toggle("hid");
}




