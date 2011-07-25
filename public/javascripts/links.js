$(function() {
  $link_categories = $(".link_category .title")
  $link_categories.each(function() {
    $(this).click(function() {
      $(this).next().toggle();
    });
  });
});
