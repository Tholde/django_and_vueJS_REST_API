import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/TableView.vue'
import AboutView from '../views/AboutView.vue'
import EditView from "@/views/EditView.vue";
import AddView from "@/views/AddView.vue";


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
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
  ]
})

export default router
