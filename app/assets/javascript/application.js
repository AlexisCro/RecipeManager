//= require jquery3
//= require popper
//= require bootstrap
//= require select2

document.addEventListener('turbo:load', ()=>{
    $('.select2').select2()
})

function addLogoFlash(image) {
    let flashSuccess = document.querySelector('.alert-success')
    let flash        = document.querySelector('.flash')
    flashSuccess.insertAdjacentHTML('beforeend', image)

    setTimeout( () => {
        flash.classList.add('remove-flash')
    }, 5000)

    setTimeout( () => {
        flash.style.display = 'none'
    }, 5500)
}