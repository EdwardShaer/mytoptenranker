const liArray = Array.from(document.getElementsByTagName('LI'));
const imgArray = Array.from(document.body.querySelector('ul').getElementsByTagName('IMG'));
imgArray.forEach((img) => {
    img.style.display = 'none'
});
let img_index = 0;


change();

function change() {
    liArray.forEach(li => {
     
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
        img_index = (img_index + 1) % 3;
    });
    //call change every second 
    setTimeout(change, 1000);
}