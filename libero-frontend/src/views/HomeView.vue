<template>
  <div class="home">
    <router-link to="/login">Login</router-link> |
    <router-link to="/register">Register</router-link> |
    <router-link to="/app">App area</router-link> |
    <router-link to="/admin">Admin area</router-link> |
    <router-link to="/privacy">Privacy policy</router-link> |
    <router-link to="/imprint">Imprint</router-link>
  </div>
</template>

<script>
export default {
  name: "Home",
  components: {}
};
</script>
