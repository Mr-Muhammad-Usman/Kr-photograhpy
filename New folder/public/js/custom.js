// wow animation js

$(function () {
  new WOW().init();
});
$(function () {
  $("div#navbar > ul > li").each(function () {
    var mobbody = $(this).html();
    $(".sidenav").append("<div>" + mobbody + "</div>");
  });
  $("#mySidenav a").each(function () {
    if ($(this).find(".caret").length > 0) {
      $(this).parent("div").attr("id", "hassubmenu");
      $(this).after('<i class="fa fa-angle-down"></i>');
    }
  });
  $("#mySidenav #hassubmenu i.fa.fa-angle-down").click(function () {
    $(this).next("ul.dropdown-menu").slideToggle();
  });
});
function openNav() {
  document.getElementById("mySidenav").style.left = "0px";
}

function closeNav() {
  document.getElementById("mySidenav").style.left = "-250px";
}