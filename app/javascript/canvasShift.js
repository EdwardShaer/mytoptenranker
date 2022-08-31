liArray = Array.from(document.getElementsByTagName('LI'));
imgArray = Array.from(document.body.querySelector('ul').getElementsByTagName('IMG'));
imgArray.forEach((img) => {
    img.style.display = 'none'
});

    


change();

function change(img_index = 0) {
    liArray.forEach(li => {

        page_reached = true;
     
        let canvas = li.querySelector('.canvas');

        let ctx = canvas.getContext('2d');
        let images = Array.from(li.querySelectorAll('img'));

        ctx.clearRect(0,0, canvas.clientWidth, canvas.height);
        let img = images[img_index];
        //scale between image and canvas
        let scale = Math.max(canvas.width/img.width, canvas.height/img.height);
        let x = (canvas.width/2) - (img.width/2) * scale;
        let y = (canvas.height/2) - (img.width/2) * scale;
        ctx.drawImage(img, x, y, img.width * scale, img.height * scale);
        
        //shift to next image for next change
        
    });
    //call change every 1.5 seconds
    setTimeout(change, 1500, (img_index + 1) % 3);
}