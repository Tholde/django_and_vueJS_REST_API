import { createRouter, createWebHistory } from '@ionic/vue-router';
import EditView from "@/views/EditView.vue";
import AddView from "@/views/AddView.vue";
import LoginView from "@/views/LoginView.vue";
import RegisterView from "@/views/RegisterView.vue";
import TableView from "@/views/TableView.vue";

// Define routes
const routes = [
  {
    path: '/',
    name: 'home',
    component: TableView
  },
  {
    path: '/add',
    name: 'add',
    component: AddView
  },
  {
    path: '/edit/:id',
    name: 'edit',
    component: EditView
  },
  {
    path: '/login',
    name: 'login',
    component: LoginView
  },
  {
    path: '/register',
    name: 'register',
    component: RegisterView
  }
];

// Create router
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes
});

// Navigation guard for authentication
// router.beforeEach((to, from, next) => {
//   const publicPages = ['/login', '/register','/'];
//   const authRequired = !publicPages.includes(to.path);
//   const loggedIn = localStorage.getItem('token');
//
//   if (authRequired && !loggedIn) {
//     return next('/login');
//   }
//
//   next();
// });

export default router;
