<template>
  <div class="login">
    <div class="social">
      <button>Continue with Google</button>
    </div>
    <div class="separator">
      <span>or</span>
      <hr>
    </div>
    <div class="traditional">
      <form class="login-form">
        <input type="email" id="email" placeholder="Email address" required>
        <input type="password" id="password" placeholder="Password" required>
        <input type="submit" value="Login">
      </form>
      <p>Need an account? Click <router-link to="/register">here</router-link> to create one.</p>
    </div>
  </div>
</template>

<style lang="scss" scoped>
.login-form, .social {
  display: flex;
  flex-direction: column;
}

.separator {
  display: flex;
  justify-content: center;

  span {
    position: absolute;
    background-color: white;
    padding: 0 0.5rem;
  }

  hr {
    width: 80%;
  }
}
</style>
