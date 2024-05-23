<script setup>
import imageUrl from '@/assets/images/agribusiness.png';
</script>

<template>
  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-dark" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="/"><img :src="imageUrl" alt="Agribusiness Logo"
                                            style="width: 180px; height: 55px;"/></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
              aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>
      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <RouterLink to="/" class="nav-link">Home</RouterLink>
          </li>
          <li class="nav-item">
            <RouterLink to="/about" class="nav-link">About</RouterLink>
          </li>
        </ul>
      </div>
    </div>
  </nav>
    <!-- ################# Slider Starts Here#######################--->

</template>

<style scoped>

</style>