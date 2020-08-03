$(document).on(typeof Turbolinks === 'undefined' ? 'ready' : 'turbolinks:load', function() {
  $(".administrate-field-jsonb-accordion").each(function() {
    $(this).click(function() {
      $(this).toggleClass("administrate-field-jsonb-active").next().toggle();
    });
  });
});
