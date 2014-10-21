(function () {
    document.addEventListener("DOMContentLoaded", function () {
        var $holder = $('#HoverDetailsHolder');
        
        $('.hoveredItem').on("mouseenter", function (el) {
            $('#HoverDetailsOptions input').val(el.currentTarget.dataset.id);
            __doPostBack($('#HoverDetailsHolder > div').attr('id'));
            $holder.css({ top: el.clientY + 20, left: el.clientX + 20 }).fadeIn("fast");
        });

        $holder.on("mouseover", function () {
            $holder.on("mouseleave", function () {
                $holder.off("mouseleave");
                $holder.fadeOut("fast");
            })
        });
    });
}());