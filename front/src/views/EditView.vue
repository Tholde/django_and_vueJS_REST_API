<script setup>
import {onMounted, ref} from "vue";
import axios from "axios";
import {useRoute, useRouter} from "vue-router";

const user = ref({
  usercode: '',
  fullname: '',
  email: '',
  password: ''
})

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
    console.log(updatedUser)
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
  <div class="d-flex justify-content-center">
    <div class="card text-center col-6">
      <form class="user" method="post" @submit.prevent="updateUser">
        <div class="card-header">
          Edit User
        </div>
        <div class="card-body">
          <div class="mb-3">
            <input class="form-control form-control-user" type="text"
                   id="exampleLastName" placeholder="Enter Name" v-model="user.fullname"
                   required
                   style="background: transparent;display: inline-flex;position: relative;">

          </div>
          <div class="mb-3">
            <input class="form-control form-control-user" type="email"
                   id="exampleInputEmail" aria-describedby="emailHelp" v-model="user.email"
                   placeholder="Enter Email Address" required
                   style="background: transparent;display: inline-flex;position: relative;">
          </div>
          <div class="mb-3">
            <input class="form-control form-control-user" type="password"
                   id="exampleInputEmail" aria-describedby="emailHelp" v-model="user.password"
                   placeholder="Enter Email Password" required
                   style="background: transparent;display: inline-flex;position: relative;">
          </div>
        </div>
        <div class="card-footer text-muted">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
            <RouterLink to="/" style="color: aliceblue">Go to Back</RouterLink>
          </button>
          <button type="submit" class="btn btn-primary" id="submitBtn"
                  style="color: aliceblue; background-color: darkcyan; border-color: aliceblue; text-transform: uppercase;">
            UPDATE
          </button>
        </div>
      </form>
    </div>
  </div>
</template>

<style scoped>

</style>