<script setup>
import { computed, onMounted, ref } from "vue";
import axios from "axios";
import {IonTitle, IonButton, IonToolbar, IonHeader, IonCol, IonSearchbar, IonRow, IonGrid, IonCardTitle, IonCardHeader, IonLabel, IonItem, IonList, IonContent, IonCard, IonPage, IonCardContent} from "@ionic/vue";

const users = ref([]);
const searchTerm = ref("");

onMounted(async () => {
  try {
    const response = await axios.get('http://localhost:8000/api/users/');
    users.value = response.data;
    console.log(users);
  } catch (error) {
    console.error('Error fetching data:', error);
  }
});
const filteredUsers = computed(() => {
  if (!searchTerm.value) {
    return users.value;
  }
  return users.value.filter(user => {
    const searchTextLower = searchTerm.value.toLowerCase();
    return (
        user.fullname.toLowerCase().includes(searchTextLower) ||
        user.email.toLowerCase().includes(searchTextLower)
    );
  });
});

async function deleteUser(userId) {
  try {
    const confirmation = confirm('Are you sure you want to delete this user?');
    if (!confirmation) return;
    const response = await axios.delete(`http://localhost:8000/api/users/${userId}`);
    console.log('User deleted successfully:', response.data);
    users.value = users.value.filter(user => user.usercode !== userId);
  } catch (error) {
    console.error('Error deleting user:', error);
    alert('Error deleting user:' + error)
  }
}

</script>

<template>
  <ion-page>
    <ion-header>
      <ion-toolbar color="succes">
        <ion-title style="font-size: 16px">Users Management</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content class="ion-padding">
      <ion-grid>
        <ion-row>
          <ion-col size="12" size-md="4">
            <RouterLink to="/add">
              <ion-button expand="block" style="background: darkcyan; color: aliceblue">Add User</ion-button>
            </RouterLink>
          </ion-col>
          <ion-col size="12" size-md="4">
            <ion-searchbar v-model="searchTerm" placeholder="Search Users..."></ion-searchbar>
          </ion-col>
        </ion-row>
      </ion-grid>

      <ion-grid>
        <ion-row>
          <ion-col size="12">
            <ion-card>
              <ion-card-header>
                <ion-card-title>Users List</ion-card-title>
              </ion-card-header>

              <ion-card-content>
                <ion-list>
                  <ion-item lines="full" v-if="filteredUsers.length === 0">
                    <ion-label class="ion-text-center">No users found.</ion-label>
                  </ion-item>
                  <ion-item lines="full" v-for="user in filteredUsers" :key="user.usercode">
                    <ion-label>
                      <h2>{{ user.fullname }}</h2>
                      <p>{{ user.email }}</p>
                    </ion-label>
                    <ion-button style="background: darkorange; border-radius: 10px" fill="clear" color="dark" :href="'/edit/' + user.usercode">Edit</ion-button>
                    <ion-button style="background: darkred; border-radius: 10px" fill="clear" color="dark" @click="deleteUser(user.usercode)">Delete</ion-button>
                  </ion-item>
                </ion-list>
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
