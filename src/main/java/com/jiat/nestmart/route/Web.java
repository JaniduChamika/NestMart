package com.jiat.nestmart.route;

import com.jiat.nestmart.controller.AccountController;
import com.jiat.nestmart.controller.CartController;
import com.jiat.nestmart.controller.HomeController;
import com.jiat.nestmart.controller.UserDashboardController;
import com.jiat.nestmart.controller.VendorController;
import com.jiat.nestmart.controller.WishlistController;
import com.jiat.mvc.core.interfaces.BaseRouter;
import com.jiat.mvc.core.route.Router;
import com.jiat.nestmart.controller.AddressController;
import com.jiat.nestmart.controller.admin.AdminController;
import com.jiat.nestmart.controller.CheckoutController;
import com.jiat.nestmart.controller.OrderController;
import com.jiat.nestmart.controller.ProductController;
import com.jiat.nestmart.controller.admin.AdminUserController;

/**
 *
 * @author Achintha
 */
public class Web implements BaseRouter {

    @Override
    public void registerRouter() {
        Router.get("", new HomeController(), "index");
        Router.get("/", new HomeController(), "index");
        Router.get("/index", new HomeController(), "index");
        Router.get("/home", new HomeController(), "index");
        Router.get("/sign-in", new AccountController(), "index");
        Router.get("/cart", new CartController(), "index");
        Router.get("/wishlist", new WishlistController(), "index");
        Router.get("/product", new HomeController(), "productDetails");
        Router.get("/dashboard", new UserDashboardController(), "index");
        Router.get("/shop", new HomeController(), "shop");
        Router.get("/seller", new VendorController(), "index");
        Router.get("/seller/", new VendorController(), "index");
        Router.get("/admin/", new AdminController(), "index");
        Router.get("/admin", new AdminController(), "index");
        Router.get("/admin/sign-in", new AdminController(), "signin");
        Router.post("/admin/login", new AdminController(), "loginAdmin");
        Router.post("/admin/change-user-state", new AdminUserController(), "changeUserState");
        Router.get("/admin/view-user", new AdminUserController(), "veiwUsers");
        Router.get("/admin/blacklist-user", new AdminUserController(), "veiwblackListUsers");
        Router.get("/admin/pending-req", new AdminUserController(), "viewPendingReq");
        Router.get("/admin/active-seller", new AdminUserController(), "viewActiveSeller");
        Router.get("/admin/blocked-seller", new AdminUserController(), "viewBlockedSeller");
        Router.post("/admin/change-vendro-state", new AdminUserController(), "changeVendorState");
//        seller order manage 

        Router.get("/seller/view-product", new VendorController(), "viewProductView");
        Router.get("/seller/trash-product", new VendorController(), "viewTrashProduct");
        Router.get("/seller/order-history", new VendorController(), "viewOrder");
        Router.get("/seller/pending-order", new VendorController(), "viewPendingOrder");
        Router.get("/seller/active-order", new VendorController(), "viewActiveOrder");
        Router.post("/seller/update-order-status", new OrderController(), "updateOrderStatus");

        Router.post("/register-user", new AccountController(), "registerUser");
        Router.post("/login-user", new AccountController(), "loginUser");
        Router.get("/account", new AccountController(), "account");
        Router.get("/logout", new AccountController(), "logout");

        Router.get("/seller/register", new VendorController(), "becomeSeller");
        Router.post("/register-seller", new VendorController(), "addSeller");

        Router.post("/get-district", new AddressController(), "getDistrict");
        Router.post("/get-city", new AddressController(), "getCity");
        Router.post("/get-postcode", new AddressController(), "getPostCode");

        Router.get("/seller/add-product", new ProductController(), "addProductView");
        Router.post("/seller/create-product", new ProductController(), "addNewProduct");
        Router.post("/seller/get-subcategory", new ProductController(), "getSubCategory");
        Router.post("/seller/upload-product-images", new ProductController(), "uploadProductImages");
        Router.post("/seller/move-trash", new ProductController(), "moveTrashProduct");
        Router.post("/seller/recycle-trash", new ProductController(), "recycleTrashProduct");
        Router.post("/seller/edit-product", new ProductController(), "editProductView");
        Router.post("/seller/update-product", new ProductController(), "updateProduct");
        Router.post("/seller/update-product-img", new ProductController(), "updateProductImages");

        Router.post("/add-to-cart", new CartController(), "addItemToCart");
        Router.post("/update-cart-qty", new CartController(), "updateCartQty");
        Router.post("/remove-from-cart", new CartController(), "removeFromCart");

        Router.post("/add-to-wishlist", new WishlistController(), "addToWishlist");
        Router.post("/remove-from-wishlist", new WishlistController(), "removeFromWishlist");

        Router.get("/cart/checkout", new CheckoutController(), "cartCheckout");
        Router.post("/product/checkout", new CheckoutController(), "productCheckout");
        Router.post("/product/place-order", new CheckoutController(), "productplaceOrder");
        Router.post("/cart/place-order", new CheckoutController(), "placeOrder");
//        Router.get("/signin", new AccountController(), "index");
//        Router.post("/login_action", new AccountController(), "login");
//        
//        Router.get("/signup", new AccountController(), "signup");
//        Router.post("/signup_action", new AccountController(), "register");
        Router.get("/verify", new AccountController(), "verifyEmail");
        Router.get("/verify_email", new AccountController(), "verifyError");
        Router.get("/verify_account", new AccountController(), "verifyAccount");
        Router.get("/send-verification", new AccountController(), "sendVerification");
        Router.get("/seller/wait-approve", new AccountController(), "waitApprove");
        Router.get("/seller/account-blocked", new AccountController(), "accountBlocked");
//        
//        Router.get("/logout", new AccountController(), "logout");
//        
//        Router.get("/dashboard", new DashboardController(), "index");
//        Router.get("/my-profile", new DashboardController(), "profile");
//        Router.get("/edit-profile", new DashboardController(), "editProfile");
    }

}
