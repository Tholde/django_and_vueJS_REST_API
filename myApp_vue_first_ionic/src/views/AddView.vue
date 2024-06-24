<script setup>
import {
  IonPage,
  IonHeader,
  IonToolbar,
  IonTitle,
  IonContent,
  IonItem,
  IonLabel,
  IonInput,
  IonButton,
  IonFooter,
  IonCard,
  IonCardTitle,
  IonCardHeader,
  IonCardContent,
  IonGrid,
  IonRow,
  IonCol
} from '@ionic/vue';
import axios from 'axios';
import {ref} from "vue";
import {useRouter} from "vue-router";

const user = ref({
  fullname: '',
  email: '',
  password: ''
});

const router = useRouter()
const API_ENDPOINT = 'http://localhost:8000/api/users/';

const submitForm = () => {
  console.log(user.value)
  console.log(user.value.password.length)
  if(user.value.password.length > 5) {
    try {
      const response = axios.post(API_ENDPOINT, user.value);
      console.log(response.status);
      alert("User saved successfully!");
      user.value = {fullname: '', email: '', password: ''};
      router.push('/');

    } catch (error) {
      console.error(error.response.status);
      alert("Input error\nVerify your password must be at least 6 characters long");
    }
  }else{
    alert("Something have an error!");
  }
}
</script>

<template>
  <ion-page>
    <ion-header>
      <ion-toolbar color="primary">
        <ion-title>Add User</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content class="ion-padding">
      <ion-grid>
        <ion-row class="ion-justify-content-center">
          <ion-col size="12" size-md="6">
            <ion-card>
              <ion-card-header>
                <ion-card-title>Add User</ion-card-title>
              </ion-card-header>
              <ion-card-content>
                <ion-item>
                  <ion-label position="floating">Enter Name</ion-label>
                  <ion-input type="text" v-model="user.fullname" required></ion-input>
                </ion-item>
                <ion-item>
                  <ion-label position="floating">Enter Email Address</ion-label>
                  <ion-input type="email" v-model="user.email" required></ion-input>
                </ion-item>
                <ion-item>
                  <ion-label position="floating">Enter Password</ion-label>
                  <ion-input type="password" v-model="user.password" required></ion-input>
                </ion-item>
                <ion-footer class="ion-text-center">
                  <ion-button @click="submitForm" color="tertiary" expand="full" style="margin-top: 1rem;">Save
                  </ion-button>
                  <RouterLink to="/">
                    <ion-button color="medium" expand="full" style="margin-top: 1rem;">Go Back</ion-button>
                  </RouterLink>
                </ion-footer>
              </ion-card-content>
            </ion-card>
          </ion-col>
        </ion-row>
      </ion-grid>
    </ion-content>
  </ion-page>
</template>

<style scoped>
ion-button {
  text-transform: uppercase;
}
</style>
