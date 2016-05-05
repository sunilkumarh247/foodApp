<!DOCTYPE html>
<html>
<head>
    <title>Winery: Checkout</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.shop.js"></script>
</head>

<body id="checkout-page">

<div id="site">
    <header id="masthead">
        <h1>Romantic Food <span class="tagline">Food business since 1999</h1>
    </header>
    <div id="content">
        <h1>Checkout</h1>
        <table id="checkout-cart" class="shopping-cart">
            <thead>
            <tr>
                <th scope="col">Item</th>
                <th scope="col">Qty</th>
                <th scope="col">Price</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
        <div id="pricing">
            <p id="sub-total">
                <strong>Total</strong>: <span id="stotal"></span>
            </p>
        </div>

        <form action="order.html" method="post" id="checkout-order-form">
            <h2>Your Details</h2>

            <fieldset id="fieldset-billing">
                <legend>Billing</legend>
                <div>
                    <label for="name">Name</label>
                    <input type="text" name="name" id="name" data-type="string" data-message="This field cannot be empty" />
                </div>
                <div>
                    <label for="email">Email</label>
                    <input type="text" name="email" id="email" data-type="expression" data-message="Not a valid email address" />
                </div>
                <div>
                    <label for="city">City</label>
                    <input type="text" name="city" id="city" data-type="string" data-message="This field cannot be empty" />
                </div>
                <div>
                    <label for="address">Address</label>
                    <input type="text" name="address" id="address" data-type="string" data-message="This field cannot be empty" />
                </div>
                <div>
                    <label for="zip">ZIP Code</label>
                    <input type="text" name="zip" id="zip" data-type="string" data-message="This field cannot be empty" />
                </div>
                <div>
                    <label for="country">Country</label>
                    <select name="country" id="country" data-type="string" data-message="This field cannot be empty">
                        <option value="">Select</option>
                        <option value="US">USA</option>
                        <option value="IT">Italy</option>
                    </select>
                </div>
            </fieldset>

            <div id="shipping-same">Same as Billing <input type="checkbox" id="same-as-billing" value=""/></div>

            <fieldset id="fieldset-shipping">

                <legend>Shipping</legend>

                <div>
                    <label for="sname">Name</label>
                    <input type="text" name="sname" id="sname" data-type="string" data-message="This field cannot be empty" />
                </div>
                <div>
                    <label for="semail">Email</label>
                    <input type="text" name="semail" id="semail" data-type="expression" data-message="Not a valid email address" />
                </div>
                <div>
                    <label for="scity">City</label>
                    <input type="text" name="scity" id="scity" data-type="string" data-message="This field cannot be empty" />
                </div>
                <div>
                    <label for="saddress">Address</label>
                    <input type="text" name="saddress" id="saddress" data-type="string" data-message="This field cannot be empty" />
                </div>
                <div>
                    <label for="szip">ZIP Code</label>
                    <input type="text" name="szip" id="szip" data-type="string" data-message="This field cannot be empty" />
                </div>
                <div>
                    <label for="scountry">Country</label>
                    <select name="scountry" id="scountry" data-type="string" data-message="This field cannot be empty">
                        <option value="">Select</option>
                        <option value="US">USA</option>
                        <option value="IT">Italy</option>
                    </select>
                </div>
            </fieldset>

            <p><input type="submit" id="submit-order" value="Submit" class="btn" /></p>

        </form>
    </div>
</div>

<footer id="site-info">
    Copyright &copy; Winery
</footer>

</body>
<script>
    $(function(){
        displayCheckoutCart();
    });

    function displayCheckoutCart() {
        $checkoutElement = $("#checkout-cart");
        var $cartBody = $checkoutElement.find("tbody");
        if (sessionStorage.getItem("SpringCart") == null) {
            $cartBody.html("");
            $("#stotal")[0].innerHTML = "$" + 0.00;
            return;
        }
        var checkoutCart = JSON.parse(sessionStorage.getItem("SpringCart"));
        var cartItems = checkoutCart.items;

        if (cartItems.length > 0 ) {
            for (var j = 0; j < cartItems.length; ++j) {
                var cartItem = cartItems[j];
                var cartProduct = cartItem.product;
                var cartPrice = "$" + cartItem.price;
                var cartQty = cartItem.qty;
                var row = "<tr><td class='pname'>" + cartProduct + "</td>" + "<td class='pqty'>" + cartQty + "</td>" + "<td class='pprice'>" + cartPrice + "</td></tr>";
                $cartBody.append(row);
            }
            var cartTotal = sessionStorage.getItem("SpringTotal");
            $("#stotal")[0].innerHTML = "$" + cartTotal;
        } else {
            $cartBody.html("");
            $("#stotal")[0].innerHTML = "$" + 0.00;
        }
    }
</script>
</html>