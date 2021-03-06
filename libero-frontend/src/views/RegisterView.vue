<template>
  <div class="register">
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
      <form @submit.prevent="register" class="registration-form">
        <TextInput
          class="input"
          label="Email address"
          type="email"
          required
          v-model="email"
          @invalid="invalidEmail"
        />
        <p class="error">
          <span v-if="errors.email">Please enter a valid email address.</span>
        </p>
        <PasswordInput
          class="input"
          label="Password"
          required
          autocomplete="new-password"
          v-model="password"
          @invalid="invalidPassword"
        />
        <p class="error">
          <!-- TODO: reserve space for strength indicator to avoid jumping -->
          <PasswordStrengthIndicator class="input" v-if="password" :password="password"/>
          <span v-if="errors.password">Please choose a password.</span>
        </p>
        <input type="submit" value="Register"/>
      </form>
      <p>
        Already have an account? Click
        <router-link to="/login">here</router-link>
        to log in.
      </p>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import TextInput from "@/components/TextInput.vue";
import PasswordInput from "@/components/PasswordInput.vue";
import PasswordStrengthIndicator from "@/components/PasswordStrengthIndicator.vue";

export default Vue.extend({
  data: function() {
    return {
      email: "",
      password: "",
      errors: {
        email: false,
        password: false
      }
    };
  },
  methods: {
    updatePassword: function(value: string) {
      this.password = value;
    },
    invalidEmail: function() {
      this.errors.email = true;
    },
    invalidPassword: function() {
      this.errors.password = true;
    },
    register: function() {
      console.log({
        email: this.email,
        password: this.password
      });
    }
  },
  components: {
    TextInput,
    PasswordInput,
    PasswordStrengthIndicator
  }
});
</script>

<style lang="scss" scoped>
.registration-form,
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

.registration-form {
  .input {
    width: 20rem;
  }

  input {
    width: 20rem;
  }

  .error {
    height: 1rem;
    font-size: 0.6rem;
    color: variables.$error;
  }
}
</style>
