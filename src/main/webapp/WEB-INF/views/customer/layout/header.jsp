 <header>
        <div class="container-header">
            <div class="header-content-right">
                <h2>Explore</h2>
            </div>


            <nav class="header-content-center">

                <ul class="main-menu">
                    <li><a href="${base }/home">Home</a></li>
                    <li><a href="#">Mens</a></li>
                    <li><a href="#">Womens</a></li>
                    <li><a href="#">Kids</a></li>
                    <li><a href="#">Blog</a></li>
                    <li><a href="${base }/contact">Contact</a></li>
                </ul>

            </nav>


            <%-- <div class="header-content-left">
                <div class="icon_cart">
                    <img src="${base}/img/home_img/cart.png" alt="" class="location_cart">
                </div>
                <div class="header-account">



                    <h4>My Account</h4>


                    <div class="icon_arrow">
                        <img src="${base}/img/home_img/arrow.png" alt="" class="location_arrow">
                    </div>

                </div>
            </div> --%>
            <form class="d-flex">
                <a class="btn btn-outline-dark" href="${base }/cart/checkout">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill" id="iconShowTotalItemsInCart">
                    	
                    </span>
                </a>
            </form>
        </div>
    </header>