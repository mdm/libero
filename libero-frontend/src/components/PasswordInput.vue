<template>
    <TextInput
        :label="label"
        :value="value"
        :type="show ? 'text' : 'password'"
        :autocomplete="autocomplete"
        :actionIcon="show ? ['far', 'eye-slash'] : ['far', 'eye']"
        @input="input"
        @action="toggleShow"
    />
</template>

<script lang="ts">
import Vue from "vue";
import TextInput from "@/components/TextInput.vue";

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
    autocomplete: {
      type: String,
      default: ""
    }
  },
  data: function() {
    return {
      show: false
    };
  },
  methods: {
    input: function(value: string) {
      this.$emit("input", value);
    },
    toggleShow: function() {
      this.show = !this.show;
    }
  },
  components: {
    TextInput
  }
});
</script>

<style lang="scss" scoped>
</style>
