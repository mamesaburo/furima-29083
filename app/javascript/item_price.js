window.addEventListener('load', () => {
  const addPriceDom = document.getElementById("item-price");
  
  addPriceDom.addEventListener('keyup', function(){
    const addTaxDom = document.getElementById("add-tax-price");
    const addProfitDom = document.getElementById("profit");

    let price = this.value;
    let tax = Math.floor(price * 0.1);
    let profit = Math.floor(price * 0.9);
    addTaxDom.innerHTML = tax
    addProfitDom.innerHTML = profit
  })
});
