<template>
  <div>
    <label :class="{ active, focused }" @click="focus">
      <div class="control">
        <div class="label">
          <span>{{ label }}</span>
        </div>
        <input ref="input" :type="type" :value="value" :autocomplete="autocomplete" @input="input" @focus="focus" @blur="blur" />
      </div>
      <button v-if="actionIcon" @click="action" @focus="focus" @blur="blur" type="button">
        <fa-icon :icon="actionIcon" />
      </button>
    </label>
  </div>
</template>

<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  props: {
    label: {
      type: String,
      required: true
    },
    value: {
      type: String,
      default: ""
    },
    type: {
      type: String,
      default: "text"
    },
    autocomplete: {
      type: String,
      default: "on"
    },
    actionIcon: {
      type: Array
    }
  },
  data: function() {
    return {
      active: this.value && this.value.length > 0,
      focused: false
    };
  },
  methods: {
    input: function(event: Event) {
      const value = (event.target as HTMLInputElement).value;
      this.$emit("input", value);
    },
    focus: function(event: Event) {
      if (event.target == this.$refs.input) {
        this.active = true;
      } else {
        this.active = (this.$refs.input as HTMLInputElement).value.length > 0;  
      }
      this.focused = true;
    },
    blur: function() {
      this.active = (this.$refs.input as HTMLInputElement).value.length > 0;
      this.focused = false;
    },
    action: function() {
      this.$emit("action");
    }
  }
});
</script>

<style lang="scss" scoped>
label {
  display: flex;
  align-items: flex-end;
  width: 100%;
  height: 2rem;
  border: 1px solid grey;
  border-radius: 3px;
  padding: 2px 0.3rem;

  .control {
    position: relative;
    width: 100%;
    height: 100%;
    display: flex;
    padding-right: 2px;

    .label {
      position: absolute;
      width: 100%;
      height: 100%;
      display: flex;

      span {
        color: grey;
        align-self: flex-end;
      }
    }

    input {
      width: 100%;
      height: 70%;
      align-self: flex-end;
      border: none;

      &:focus {
        outline: none;
      }
    }
  }

  button {
    width: 2rem;
    height: 100%;
    border: none;
    align-self: center;
    background-color: white;    

    &:focus {
      outline: 1px solid variables.$accent;
    }
  }

  &.active .control .label span {
    align-self: flex-start;
    font-size: 0.5rem;
    transition: all 100ms;
  }

  &.focused {
    border: 2px solid variables.$accent;

    &.active .control .label span {
      color: variables.$accent;
    }
  }

}
</style>
