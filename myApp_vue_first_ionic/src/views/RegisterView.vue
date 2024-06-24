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
});
const router = useRouter();
const API_ENDPOINT = 'http://localhost:8000/api/register';

const submit = async () => {
  if (user.value.password === objectUser.value.confirm_pass) {
    if (!user.value.fullname || !user.value.email || !user.value.password || !user.value.fonction || !user.value.contact) {
      alert("Veuillez compléter tous les champs s'il vous plaît!");
      return;
    }
    try {
      const response = await axios.post(API_ENDPOINT, user.value);
      console.log(response.status);
      alert("Utilisateur enregistré avec succès!");
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
      alert("Vérifiez tous les champs. Si votre mot de passe est inférieur à 6 caractères ou si votre e-mail est déjà inscrit, essayez un autre e-mail.");
    }
  } else {
    alert("Le mot de passe n'est pas confirmé, vérifiez les deux mots de passe que vous avez entrés!");
  }
};
</script>

<template>
  <ion-page>
    <ion-header>
      <ion-toolbar color="white">
        <ion-title><img :src="logo" width="90" height="25" alt=""/>
          <ion-label style="position: relative; left: 30px">Register Panel</ion-label>
        </ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content class="ion-padding">
      <ion-grid>
        <ion-row class="ion-justify-content-center">
          <ion-col size="12" size-md="6">
            <ion-card>
              <ion-card-header>
                <ion-card-title class="text-success">Page de Registration</ion-card-title>
                <ion-card-subtitle>Veuillez compléter tous les champs</ion-card-subtitle>
              </ion-card-header>
              <ion-card-content>
                <form @submit.prevent="submit">
                  <ion-item>
                    <ion-label position="floating">E-mail</ion-label>
                    <ion-input type="email" v-model="user.email" required></ion-input>
                  </ion-item>
                  <ion-item>
                    <ion-label position="floating">Nom complet</ion-label>
                    <ion-input type="text" v-model="user.fullname" required></ion-input>
                  </ion-item>
                  <ion-item>
                    <ion-label position="floating">Contact</ion-label>
                    <ion-input type="text" v-model="user.contact" required></ion-input>
                  </ion-item>
                  <ion-item>
                    <ion-label position="floating">Fonction</ion-label>
                    <ion-select v-model="user.fonction" placeholder="Choisissez votre rôle..." required>
                      <ion-select-option value="paysan">Paysan</ion-select-option>
                      <ion-select-option value="technicien">Technicien</ion-select-option>
                      <ion-select-option value="fournisseur">Fournisseur</ion-select-option>
                      <ion-select-option value="partenaire">Partenaire</ion-select-option>
                    </ion-select>
                  </ion-item>
                  <ion-item>
                    <ion-label position="floating">Mot de passe</ion-label>
                    <ion-input type="password" v-model="user.password" required></ion-input>
                  </ion-item>
                  <ion-item>
                    <ion-label position="floating">Confirmer le mot de passe</ion-label>
                    <ion-input type="password" v-model="objectUser.confirm_pass" required></ion-input>
                  </ion-item>
                  <ion-button expand="block" type="submit" color="success">Créer</ion-button>
                </form>
              </ion-card-content>
              <ion-card-footer class="ion-text-center">
                <ion-card-footer class="ion-text-center">
                  <small class="text-body-secondary">Vous avez de compte ?
                    <RouterLink to="/login">Clicker ici</RouterLink>
                  </small>
                </ion-card-footer>
              </ion-card-footer>
            </ion-card>
          </ion-col>
        </ion-row>
      </ion-grid>

      <ion-footer class="ion-text-center">
        <img :src="logo" width="250" height="70" alt=""/>
        <p class="ion-text-center ion-padding-top text-body-secondary fw-bold">&copy; {{ daty }}, Design & Develop by
          Tholde Rftn</p>
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
