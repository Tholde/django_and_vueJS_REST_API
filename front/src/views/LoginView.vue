<script setup>
import axios from 'axios';
import {ref} from "vue";
import logo from '@/assets/images/agribusiness.png'
import {useRouter} from "vue-router";

const daty = new Date().getFullYear();
const email = ref('');
const password = ref('');
const fonction = ref('');
const router = useRouter();

const login = async () => {
  try {
    const response = await axios.post('http://localhost:8000/api/login', {
      email: email.value,
      password: password.value
    });
    localStorage.setItem('token', response.data.jwt);
    if (fonction.value === 'technicien') {
      await router.push('/');
    }
  } catch (error) {
    console.error(error.response.data);
  }
};
</script>

<template>
  <div class="container col-xl-10 col-xxl-8 px-4 py-5">
    <div class="row align-items-center g-lg-5 py-5">
      <div class="col-lg-7 text-center text-lg-center">
        <RouterLink class="navbar-brand col-lg-3 me-0" to="/">
          <img :src="logo" width="250" height="70">
        </RouterLink>
        <h1 class="display-4 fw-bold lh-1 text-body-emphasis mb-3">Connection</h1>
        <p class="col fs-4">Below is an example form built entirely with Bootstrap’s form controls. Each required
          form group has a validation state that can be triggered by attempting to submit the form without completing
          it.</p>
        <div class="col-ml-6 mx-5 text-center">
          <hr class="text-center">
          <p class="text-center text-body-secondary fw-bold">&copy; {{ daty }}, Design & Develop by Tholde Rftn</p>
        </div>
      </div>
      <div class="col-md-10 mx-auto col-lg-5">
        <form class="p-4 p-md-5 border rounded-3 bg-body-tertiary" method="post" @submit.prevent="login">
          <div class="mb-3 text-center">
            <h3 class="text-success">Page de Connection</h3>
            <label>
              <p class="fw-semibold">Veiller completer tous les formes</p>
            </label>
          </div>
          <div class="form-floating mb-3">
            <select class="form-select form-select" aria-label=".form-select-lg example" v-model="fonction"
                    required>
              <option selected>Choissez votre rôle...</option>
              <option value="paysan">Paysan</option>
              <option value="technicien">Technicien</option>
              <option value="fournisseur">Fournisseur</option>
              <option value="partenaire">Partenaire</option>
              <option value="admin">Admin</option>
            </select>
            <label for="floatingInput">Fonction</label>
          </div>
          <div class="form-floating mb-3">
            <input type="email" class="form-control" id="floatingInput" placeholder="Email" v-model="email"
                   required>
            <label for="floatingInput">E-mail</label>
          </div>
          <div class="form-floating mb-3">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password"
                   v-model="password" required>
            <label for="floatingPassword">Mot de pass</label>
          </div>
          <button class="w-100 btn btn-lg btn-outline-success" type="submit">Connexion</button>
          <hr class="my-4">
          <div class="mb-3 text-center">
            <small class="text-body-secondary">Pas de compte ?
              <RouterLink to="/register">Clicker ici</RouterLink>
            </small>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>
