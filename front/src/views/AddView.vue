<script setup>
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

async function submitForm() {
  console.log(user)
  try {
    const response = await axios.post(API_ENDPOINT, user.value);
    console.log(response.status);
    alert("User saved successfully!");
    user.value = {fullname: '', email: '', password: ''};
    router.push('/');
  } catch (error) {
    console.error(error.response.status);
    alert("Input error\nVerify your password must be at least 6 characters long");
  }
}
</script>

<template>
  <div class="d-flex justify-content-center">
    <div class="card text-center col-6">
      <form class="user" method="post" @submit.prevent="submitForm">
        <div class="card-header">
          Add User
        </div>
        <div class="card-body">
          <div class="mb-3">
            <input class="form-control form-control-user" type="text"
                   id="exampleLastName" placeholder="Enter Name" v-model="user.fullname" required
                   style="background: transparent;display: inline-flex;position: relative;">

          </div>
          <div class="mb-3">
            <input class="form-control form-control-user" type="email"
                   id="exampleInputEmail" aria-describedby="emailHelp"
                   placeholder="Enter Email Address" v-model="user.email" required
                   style="background: transparent;display: inline-flex;position: relative;">
          </div>
          <div class="mb-3">
            <input class="form-control form-control-user" type="password"
                   id="exampleInputEmail" aria-describedby="emailHelp"
                   placeholder="Enter Email Password" v-model="user.password" required
                   style="background: transparent;display: inline-flex;position: relative;">
          </div>
        </div>
        <div class="card-footer text-muted">
            <RouterLink to="/"><button type="button" class="btn btn-secondary">Go to Back</button></RouterLink>
            <button type="submit" class="btn btn-primary" id="submitBtn"
                    style="color: aliceblue; background-color: darkcyan; border-color: aliceblue; text-transform: uppercase;">
              SAVE
            </button>
        </div>
      </form>
    </div>
  </div>
</template>

<style scoped>

</style>