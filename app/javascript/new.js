function total_price (){
  const item_price = document.getElementById("item-price");

  item_price.addEventListener('keyup', () =>{
    const add_tax_price = document.getElementById("add-tax-price");
    add_tax_price.innerHTML = Math.floor(item_price.value * 0.1);
    const profit = document.getElementById('profit');
    profit.innerHTML = item_price.value - (Math.floor(item_price.value * 0.1));
  });
  
};


  
  

  window.addEventListener('load', total_price);