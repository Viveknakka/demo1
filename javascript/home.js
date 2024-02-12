function createCard(img,i)    
{
    var card=document.createElement("div");
    card.className='card';
    var p=document.createElement('p');
    var Price=Math.random()*20000;
    p.innerHTML="Price:₹ "+Price.toFixed(2);
    var r=document.createElement('p');
    r.innerHTML='Rating: '+(Math.random()*5).toFixed(0)+'/5';
    var btn=document.createElement("button");
    btn.innerHTML='<a href="./orderBook.jsp" target="_blank" style="text-decoration:none;">Order Now<a>';
    btn.style.marginBottom='10px';
    var dno=document.createElement("p");
    dno.innerHTML='Design no:'+i;
    card.appendChild(dno);
    card.appendChild(img);
    card.appendChild(p);
    card.appendChild(r)
    card.appendChild(btn);

    return card;
}
function display(dir){
    var contain=document.getElementById("cardContainer");
    contain.innerHTML='';
   // document.getElementById("welcome").style.display='none';
    for(var i=1;i<100;i++)
    {
        var img=new Image();
        img.src='./images/'+dir+'/image'+(i%10+1)+'.jpg';
        img.style.width='300px';
        img.style.height='300px';
       var card=createCard(img,i);
        contain.appendChild(card);
    }
//contain.style.display='block';

  // Run the function when the page loads
  
}

function addImages() {
  var container = document.getElementById('cardContainer');
  
  for (var i = 1; i <= 100; i++) {
    var img = new Image();
    img.src = './images/'+'others'+'/image'+(i%10+1)+'.jpg';
    img.alt = 'Image ' + i;
    img.style.width='300px';
    img.style.height='300px';
    var card=createCard(img,i);
    container.appendChild(card);
   
  }
}
window.onload=addImages();  

