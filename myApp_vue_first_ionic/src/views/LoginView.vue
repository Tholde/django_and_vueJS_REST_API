<script setup>
import axios from 'axios';
import { ref } from 'vue';
import logo from '@/assets/images/agribusiness.png';
import { useRouter } from 'vue-router';

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
  <ion-page>
    <ion-header>
      <ion-toolbar color="white">
        <ion-title><img :src="logo" width="90" height="25"  alt=""/><ion-label style="position: relative; left: 30px">Login Panel</ion-label></ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content class="ion-padding">
      <ion-grid>
        <ion-row class="ion-justify-content-center">
          <ion-col size="12" size-md="6">
            <ion-card>
              <ion-card-header>
                <ion-card-title class="text-success">Page de Connection</ion-card-title>
                <ion-card-subtitle>Veiller completer tous les formes</ion-card-subtitle>
              </ion-card-header>
              <ion-card-content>
                <form @submit.prevent="login">
                  <ion-item>
                    <ion-label position="floating">Fonction</ion-label>
                    <ion-select v-model="fonction" placeholder="Choissez votre rôle..." required>
                      <ion-select-option value="paysan">Paysan</ion-select-option>
                      <ion-select-option value="technicien">Technicien</ion-select-option>
                      <ion-select-option value="fournisseur">Fournisseur</ion-select-option>
                      <ion-select-option value="partenaire">Partenaire</ion-select-option>
                      <ion-select-option value="admin">Admin</ion-select-option>
                    </ion-select>
                  </ion-item>
                  <ion-item>
                    <ion-label position="floating">E-mail</ion-label>
                    <ion-input type="email" v-model="email" required></ion-input>
                  </ion-item>
                  <ion-item>
                    <ion-label position="floating">Mot de pass</ion-label>
                    <ion-input type="password" v-model="password" required></ion-input>
                  </ion-item>
                  <ion-button expand="block" type="submit" color="success">Connexion</ion-button>
                </form>
              </ion-card-content>
              <ion-card-footer class="ion-text-center">
                <small class="text-body-secondary">Pas de compte ?
                  <RouterLink to="/register">Clicker ici</RouterLink>
                </small>
              </ion-card-footer>
            </ion-card>
          </ion-col>
        </ion-row>
      </ion-grid>

      <ion-footer class="ion-text-center">
        <img :src="logo" width="250" height="70"  alt=""/>
        <p class="ion-text-center ion-padding-top text-body-secondary fw-bold">&copy; {{ daty }}, Design & Develop by Tholde Rftn</p>
      </ion-footer>
    </ion-content>
  </ion-page>
</template>

<style scoped>
ion-card-title {
  text-align: center;
}

ion-card-subtitle {
  text-align: center;
  font-weight: 600;
}

ion-footer {
  margin-top: 2rem;
}
</style>
