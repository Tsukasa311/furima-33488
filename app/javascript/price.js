function price() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () =>{
    const addTaxPrice = document.getElementById("add-tax-price");
    const taxPrice = itemPrice.value * 0.1;
    const priceAfterTax = Math.floor(taxPrice);
    addTaxPrice.innerHTML = `${priceAfterTax}`;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${itemPrice.value - priceAfterTax}`;
  })
}

window.addEventListener("load", price);