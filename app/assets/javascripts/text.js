$(function(){
  $("li>a#test_link").on("click", function(e) {
    e.preventDefault();
    $(this).animate({"top": "1000px"}, 10000)
  });
});
