<script setup>
import { onMounted, ref } from "vue";
import axios from "axios";
import { useRoute, useRouter } from "vue-router";
import {IonButton, IonTitle, IonToolbar, IonHeader, IonCardTitle, IonCardHeader, IonLabel, IonInput, IonFooter, IonCol, IonCard, IonRow, IonContent, IonPage, IonItem, IonCardContent, IonGrid} from "@ionic/vue";

const user = ref({
  usercode: '',
  fullname: '',
  email: '',
  password: ''
});

const route = useRoute();
const router = useRouter();
const id = route.params.id;

onMounted(async () => {
  try {
    const response = await axios.get(`http://localhost:8000/api/users/${id}`);
    user.value = response.data;
    console.log(user);
  } catch (error) {
    console.error('Error fetching data');
  }
});

async function updateUser() {
  try {
    const updatedUser = {
      fullname: user.value.fullname,
      email: user.value.email,
      password: user.value.password,
    };
    console.log(updatedUser);
    const response = await axios.put(`http://localhost:8000/api/users/${id}`, updatedUser);
    console.log(response.status);
    alert("User updated successfully!");
    router.push('/');
  } catch (error) {
    console.error('Error updating user:', error.response.status);
    alert("Input error\nVerify your password must be at least 6 characters long");
  }
}
</script>

<template>
  <ion-page>
    <ion-header>
      <ion-toolbar color="primary">
        <ion-title>Edit User</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content class="ion-padding">
      <ion-grid>
        <ion-row class="ion-justify-content-center">
          <ion-col size="12" size-md="6">
            <ion-card>
              <ion-card-header>
                <ion-card-title>Edit User</ion-card-title>
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
                    <RouterLink to="/">
                      <ion-button color="medium" expand="full" style="margin-top: 1rem;">Go Back</ion-button>
                    </RouterLink>
                    <ion-button type="submit" color="tertiary" @click="updateUser" expand="full" style="margin-top: 1rem;">Update
                    </ion-button>
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
