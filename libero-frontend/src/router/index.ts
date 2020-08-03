import Vue from "vue";
import VueRouter, { RouteConfig } from "vue-router";

import auth from "../api/auth";

import HomeView from "../views/HomeView.vue";
import LoginView from "../views/LoginView.vue";
import RegisterView from "../views/RegisterView.vue";
import ImprintView from "../views/ImprintView.vue";
import PrivacyView from "../views/PrivacyView.vue";

Vue.use(VueRouter);

const routes: Array<RouteConfig> = [
  {
    path: "/",
    name: "Home",
    component: HomeView,
    meta: { public: true }
  },
  {
    path: "/login",
    name: "Login",
    component: LoginView,
    meta: { public: true }
  },
  {
    path: "/register",
    name: "Register",
    component: RegisterView,
    meta: { public: true }
  },
  {
    path: "/imprint",
    name: "Imprint",
    component: ImprintView,
    meta: { public: true }
  },
  {
    path: "/privacy",
    name: "Privacy",
    component: PrivacyView,
    meta: { public: true }
  },
  {
    path: "/app",
    name: "App",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/AppView.vue")
  },
  {
    path: "/admin",
    name: "Admin",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/AdminView.vue")
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

router.beforeEach(async (to, from, next) => {
  if (!to.matched.every(record => record.meta.public)) {
    if (!(await auth.check())) {
      // TODO: store intended target URL
      next({
        path: "/login"
      });
    } else {
      next();
    }
  } else {
    next();
  }
});

export default router;
