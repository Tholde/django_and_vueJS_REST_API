import './assets/main.css'
import 'bootstrap'

import {createApp} from 'vue'
import App from './App.vue'
import router from './router'
import Navbar from "@/components/NavbarComponent.vue";
import Footer from "@/components/FooterComponent.vue";

const app = createApp(App)
app.component('MyNavbar', Navbar);
app.component('MyFooter', Footer);
app.use(router)
app.mount('#app')
