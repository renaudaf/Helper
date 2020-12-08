const initUpdateNavbarOnScroll = () => {
 const navbar = document.querySelector('.navbar-lewagon');
 const fixNavbar = document.querySelector('.navbar');
 if (navbar) {
   window.addEventListener('scroll', () => {
     if (window.scrollY >= 575) {
      console.log('test');
       fixNavbar.classList.add('navbar-lewagon-white');
     } else {
       fixNavbar.classList.remove('navbar-lewagon-white');
     }
   });
  } else {
    fixNavbar.classList.add('navbar-lewagon-white');
 }
}

export { initUpdateNavbarOnScroll };
