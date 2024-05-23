<script setup>
import {computed, onMounted, ref} from "vue";
import axios from "axios";

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

  <h2 style="position: relative; top: 20px;">
    <div class="row">
      <div class="col-2"></div>
      <div class="col-3">
        <RouterLink to="/add">
          <button type="button" class="btn btn-primary"
                  style="width: 200px;color: aliceblue; background-color: darkcyan; border-color: aliceblue; text-transform: uppercase;">
            ADD USER
          </button>
        </RouterLink>
      </div>
      <div class="col-5">
        <input type="text" class="w-100 h-100" v-model="searchTerm" placeholder="Search Users...">
      </div>
    </div>
  </h2>

  <table id="container" class="container">
    <thead>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Email</th>
      <th>Action</th>
    </tr>
    </thead>
    <tbody id="tb">
    <tr v-if="filteredUsers.length === 0">
      <td colspan="4" style="text-align: center;">Users found in your search.</td>
    </tr>
    <tr v-for="user in filteredUsers">
      <td>{{ user.usercode }}</td>
      <td>{{ user.fullname }}</td>
      <td>{{ user.email }}</td>
      <td class="button_action">
        <RouterLink :to="'/edit/'+user.usercode">
          <button style="color: aliceblue; background-color: darkcyan; border-color: aliceblue;">
            Edit
          </button>
        </RouterLink>
        <button @click="deleteUser(user.usercode)"
                style="color: aliceblue; background-color: darkred; border-color: aliceblue;">
          Delete
        </button>
      </td>
    </tr>
    </tbody>
  </table>
</template>

<style scoped>

</style>