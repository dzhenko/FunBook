(function () {

    var container = document.getElementById('tags-container');

    var tags = container.getElementsByClassName('tagItem');

    var tagsLen = tags.length;
    var tagsCount = [];
    var maxOccurance = 0;

    for (var i = 0 ; i < tagsLen; i++) {
        var countTag = tags[i].getElementsByClassName("tagCount")[0];
        var count = parseInt(countTag.innerHTML);

        maxOccurance = Math.max(count++, maxOccurance);
        tagsCount.push({
            tag: tags[i],
            value: count
        });
    }

    generateTagCloud(tagsCount, 12, 25, maxOccurance);

    function generateTagCloud(array, min, max, numberOfOccurance) {
        var delta = 0 | ((min * numberOfOccurance) / max);

        for (var i = 0, len = array.length; i < len ; i++) {
            array[i].tag.style.margin = '3px';
            array[i].tag.style.cssFloat = 'left';
            array[i].tag.style.fontSize = (min + delta * array[i].value) + 'px';
        }
    }
})();