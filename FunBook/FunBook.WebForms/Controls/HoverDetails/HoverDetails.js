(function () {
    document.addEventListener("DOMContentLoaded", function () {
        var $holder = $('#HoverDetailsHolder');

        $('.hoveredItem').on("mouseenter", function (el) {
            var target = el.currentTarget;
            $('#HoverDetailsOptions input').val(target.dataset.id);
            __doPostBack($('#HoverDetailsHolder > div').attr('id'));
            var position = $(target).offset();
            $holder.css({ top: position.top - 290, left: position.left - 220 }).fadeIn("fast");
        });

        $holder.on("mouseover", function () {
            $holder.on("mouseleave", function () {
                $holder.off("mouseleave");
                $holder.fadeOut("fast");
            })
        });
    });
}());