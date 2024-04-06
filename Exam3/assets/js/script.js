
$('document').ready(function () {
    $('.table').DataTable();
})
const forms = document.querySelector('#form');
let cform = forms.querySelector('.category-details');
let iform = forms.querySelector('.item-details');
let UserAkshat = {
    cname:'',
    cdesc:'',
    Active:'',
    ldate:'',
    item:{}
}
let item =[];
let Akki = JSON.parse(localStorage.getItem('Akki')||'[]')
document.addEventListener('submit',function(e){
    // if(!forms.checkValidity()){
    //     e.preventDefault();
    //     e.stopPropagation();
    // }
    // else{
        e.preventDefault();
        shubmitdata();
    // }
})
function updatevalue() {
    alert('updated')
    let id = sessionStorage.getItem('uiii');
    console.log(id)
    let updatedAkshat = {
        cname: '',
        cdesc: '',
        Active: '',
        ldate: '',
        item: {}
    };

    // Update category details
    let input = cform.querySelectorAll('.row');
    input.forEach((ele, index) => {
        let cdata = ele.querySelectorAll('input,textarea');
        cdata.forEach((ele, index) => {
            if (ele.type === 'checkbox' && ele.checked) {
                updatedAkshat[ele.name] = ele.value;
            } else if (ele.type === 'textarea' || ele.type === 'text' || ele.type === 'date') {
                updatedAkshat[ele.name] = ele.value;
            }
        });
    });

    // Update item details
    let itemDetails = [];
    let iinput = iform.querySelectorAll('.row');
    iinput.forEach((ele, index) => {
        let it = {};
        let edata = ele.querySelectorAll('input,select,textarea');
        edata.forEach((ele, index) => {
            if (ele.type === 'checkbox' && ele.checked) {
                it[ele.name] = ele.value;
            } else if (['text', 'textarea', 'number', 'date', 'select-one'].includes(ele.type)) {
                it[ele.name] = ele.value;
            }
        });
        itemDetails.push(it);
    });
    updatedAkshat.item = itemDetails;

    // Update Akki array
    Akki[id] = updatedAkshat;

    // Update local storage
    localStorage.setItem('Akki', JSON.stringify(Akki));

    // console.log(updatedAkshat);
    forms.reset();
    $('#modalId').modal('hide');

}

function shubmitdata() {
    let it = {}
    // alert("hii")
    let input = cform.querySelectorAll('.row');
    input.forEach((ele,index)=>{
        let cdata = ele.querySelectorAll('input,textarea');
        cdata.forEach((ele,index)=>{
            // console.log(ele)
            if(ele.type === 'checkbox' && ele.checked){

                UserAkshat[ele.name]=ele.value;
            }
            // else if (ele.type === 'input'){
            //     UserAkshat[ele.name]=ele.value;
            // }
            else if (ele.type === 'textarea' || ele.type==='text' || ele.type==='date'){
                UserAkshat[ele.name]=ele.value;
            }
        })
    })

    let iinput = iform.querySelectorAll('.row');
    // console.log(iinput)
    iinput.forEach((ele,index)=>{
        let edata = ele.querySelectorAll('input,select,textarea')
        
        edata.forEach((ele, index) => {
            if (ele.type === 'checkbox' && ele.checked) {
                it[ele.name] = ele.value;
            } else if (['text', 'textarea', 'number', 'date', 'select-one'].includes(ele.type)) {
                it[ele.name] = ele.value;
            }
        });
        
        item.push(it);
    })
    UserAkshat.item = item;
    Akki.push(UserAkshat);
    localStorage.setItem('Akki',JSON.stringify(Akki));
    console.log(UserAkshat);
    forms.reset();
   $('#modalId').modal('hide');
}
document.addEventListener('DOMContentLoaded',function(){
    showdata();
})
function showdata(){
    // console.log('hii')
    let table = $('.table').DataTable();
    Akki.forEach((ele,index)=>{
        table.row.add([
            `<button class="btn btn-success" type="button" onclick="nesteddata(${index},this.parentNode.parentNode)">&plus;</button>`,
            ele.cname,
            ele.cdesc,
            ele.Active,
            ele.ldate,
            `<button class="btn btn-warning" type="button" onclick="updatedata(${index},this.parentNode.parentNode)">Update</button>`,
            `<button class="btn btn-danger" type="button" onclick="deletedata(${index},this.parentNode.parentNode)">Delete</button>`
        ]).draw();
    })
}

function updatedata(id,row){
    let data = Akki[id];
    $('#modalId').modal('show');
    let input = cform.querySelectorAll('.row');
    input.forEach((ele,index)=>{
        let cdata = ele.querySelectorAll('input,textarea');
        cdata.forEach((ele,index)=>{
            if(ele.type === 'checkbox' ){
                if(ele.value = data[ele.name]){
                    ele.checked= true;
                }
                
            }
            else if (ele.type === 'textarea' || ele.type==='text' || ele.type==='date'){
                ele.value = data[ele.name];
            }
        })    
    })

    let iinput = iform.querySelectorAll('.row');
    let idata = data.item;
    //  console.log(idata)
    //  console.log(iinput)
    iinput.forEach((ele,index)=>{
        let edata = ele.querySelectorAll('input,select,textarea')
        let inputdata = idata[index];
        // console.log(inputdata)
        edata.forEach((ele, index) => {
            if (ele.type === 'checkbox' && ele.value === inputdata[ele.name]) {
                 ele.checked = true;
            } else if (['text', 'textarea', 'number', 'date', 'select-one'].includes(ele.type)) {
                ele.value = inputdata[ele.name] ;
            }
        });
        
        
    })
    sessionStorage.setItem('uiii',id);
    let button = document.querySelector('#submit');
    button.style.display = 'none';
    
    let button2 = document.querySelector('#update');
    button2.style.display = 'block';
}
function deletedata(id,row){
    let del= window.confirm('Are you sure you want to delete?');
    if(del){
        row.remove();
        Akki.pop(id);
        localStorage.setItem('Akki',JSON.stringify(Akki));
    }
}

function nesteddata(id,tr){
    let data = Akki[id].item;
    let table = $('.table').DataTable();
    let code = ` <table class="table table-primary">
    <thead>
        <tr>
           
            <th scope="col">Item Name</th>
            <th scope="col">Item Desc</th>
            <th scope="col">Food Type</th>
            <th scope="col">item Price</th>
            <th scope="col">item Discount</th>
            <th scope="col">item Gst</th>
            <th scope="col">Active</th>
           
        </tr>
    </thead>
    <tbody>`

    data.forEach((ele,index)=>{
         console.log(ele);
         code +=`<tr>`
         code += `<td>`+ele.iname+`</td>`
         code += `<td>`+ele.idesc+`</td>`
         code += `<td>`+ele.ftype+`</td>`
         code += `<td>`+ele.price+`</td>`
         code += `<td>`+ele.discount+`</td>`
         code += `<td>`+ele.gst+`</td>`
         code += `<td>`+ele.Active+`</td>` 
         code += `</tr>`
    })
    code += `</tbody></table>`
    
    if(table.row(tr).child.isShown()){
        table.row(tr).child(code).hide();
    }
    else{
       
        table.row(tr).child(code).show();
    }
}