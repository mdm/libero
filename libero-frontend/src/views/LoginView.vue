<template>
  <div class="login">
    <div class="social">
      <button>
        <img src="@/assets/images/social_logo_facebook.svg" height="25" /><span
          >Continue with Facebook</span
        >
      </button>
      <button>
        <img src="@/assets/images/social_logo_google.svg" height="25" /><span
          >Continue with Google</span
        >
      </button>
      <button>
        <img src="@/assets/images/social_logo_twitter.svg" height="25" /><span
          >Continue with Twitter</span
        >
      </button>
    </div>
    <div class="separator">
      <span>or</span>
      <hr />
    </div>
    <div class="traditional">
      <form class="login-form">
        <input type="email" id="email" placeholder="Email address" required />
        <input type="password" id="password" placeholder="Password" required />
        <input type="submit" value="Login" />
      </form>
      <p>
        Need an account? Click <router-link to="/register">here</router-link> to
        create one.
      </p>
    </div>
  </div>
</template>

<style lang="scss" scoped>
.login-form,
.social {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.social button {
  display: flex;
  align-items: center;
  width: 20rem;
  height: 2rem;
  justify-content: space-between;

  img {
    padding: 0 0.5rem;
  }

  span {
    width: 16rem;
    text-align: center;
  }
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

.login-form {
  input {
    width: 20rem;
  }
}
</style>
