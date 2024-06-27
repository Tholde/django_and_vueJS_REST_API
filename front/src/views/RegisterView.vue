<script setup>
import logo from '@/assets/images/agribusiness.png';
import {ref} from 'vue';
import {useRouter} from 'vue-router';
import axios from 'axios';

const daty = new Date().getFullYear();

const user = ref({
  fullname: '',
  email: '',
  password: '',
  fonction: '',
  contact: ''
});
const objectUser = ref({
  confirm_pass: ''
})
const router = useRouter()
const API_ENDPOINT = 'http://localhost:8000/api/register';
const submit = async () => {
  if (user.value.password === objectUser.value.confirm_pass) {
    if (!user.value.fullname || !user.value.email || !user.value.password || !user.value.fonction || !user.value.contact) {
      alert("Veillez completer tout les frormes s'il vous plait!");
      return;
    }
    try {
      const response = await axios.post(API_ENDPOINT, user.value);
      console.log(response.status);
      alert("Utilisateur enregistrer avec succès!");
      user.value = {
        fullname: '',
        email: '',
        password: '',
        fonction: '',
        contact: ''
      };
      await router.push('/login');
    } catch (error) {
      console.error('Registration error:', error);
      alert("Verifier tout les formes\nSi votre mot de pass s'il est moins de 6 caractères\nou votre e-mail déjà inscrit, essayez d'autre e-mail.");
    }
  }else {
    alert("Mot de pass n'est pas confirmer, verifier les deux mot de pass que vous avez entré!")
  }
};
</script>
<template>
  <div class="px-lg-5">
    <div class="container-lg">
      <div class="row align-items-center">
        <div class="col">
          <form @submit.prevent="submit" method="post" class="p-4 p-md-5 border rounded-3 bg-body-tertiary">
            <div class="mb-3 text-center">
              <h3 class="text-success">Page de Registration</h3>
              <label>
                <p class="fw-semibold">Veiller completer tous les formes</p>
              </label>
            </div>
            <div class="form-floating mb-3">
              <input type="email" class="form-control" id="floatingInput" v-model="user.email"
                     placeholder="name@example.com" required>
              <label for="floatingInput">E-mail</label>
            </div>
            <div class="form-floating mb-3">
              <input type="text" class="form-control" id="floatingInput" v-model="user.fullname" placeholder="Fullname"
                     required>
              <label for="floatingInput">Nom complet</label>
            </div>
            <div class="form-floating mb-3">
              <input type="text" class="form-control" id="floatingInput" v-model="user.contact" placeholder="Contact"
                     required>
              <label for="floatingInput">Contact</label>
            </div>
            <div class="form-floating mb-3">
              <select class="form-select form-select" aria-label=".form-select-lg example" v-model="user.fonction" required>
                <option selected>Choissez votre rôle...</option>
                <option value="paysan">Paysan</option>
                <option value="technicien">Technicien</option>
                <option value="fournisseur">Fournisseur</option>
                <option value="partenaire">Partenaire</option>
              </select>
              <label for="floatingInput">Fonction</label>
            </div>
            <div class="form-floating mb-3">
              <input type="password" class="form-control" id="floatingPassword" v-model="user.password"
                     placeholder="Password" required>
              <label for="floatingPassword">Mot de pass</label>
            </div>
            <div class="form-floating mb-3">
              <input type="password" class="form-control" id="floatingPassword" v-model="objectUser.confirm_pass"
                     placeholder="Password" required>
              <label for="floatingPassword">Confirmer le mot de pass</label>
            </div>
            <button class="w-100 btn btn-lg btn-outline-success" type="submit">Creer</button>
            <hr class="my-4">
            <div class="mb-3 text-center">
              <small class="text-body-secondary">Vous avez de compte ?
                <RouterLink to="/login">Clicker ici</RouterLink>
              </small>
            </div>
          </form>
        </div>
        <div class="col-lg-7 mx-2 text-center text-lg-center">
          <RouterLink class="navbar-brand col-lg-3 me-0" to="/">
            <img :src="logo" width="250" height="70">
          </RouterLink>
          <div class="row"></div>
          <h1 class="display-4 fw-bold lh-1 text-body-emphasis mb-3">Registration</h1>
          <p class="col fs-4">Below is an example form built entirely with Bootstrap’s form controls. Each required
            form group has a validation state that can be triggered by attempting to submit the form without completing
            it.</p>
          <div class="col-ml-6 mx-5 text-center">
            <hr class="text-center">
            <p class="text-center text-body-secondary fw-bold">&copy; {{ daty }}, Design & Develop by Tholde Rftn</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<style scoped>

</style>