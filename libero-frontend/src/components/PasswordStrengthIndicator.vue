<template>
  <div>
    <div class="bars">
      <div class="first">
      </div>
      <div class="second">
      </div>
      <div class="third">
      </div>
      <div class="fourth">
      </div>
    </div>
    <div class="description">
    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  props: {
    password:{
        type: String,
        required: true
    }
  }
});
</script>

<style scoped lang="scss">
.bars {
  display: flex;

  div {
    border: 1px solid grey;
    background-color: white;
    margin: 2px;
  }

  div:first-child, div:last-child {
    margin: 2px 0;
  }
}

.very-weak {
    &.bars {
        .first {
            background-color: grey;
        }

        .second {
            background-color: grey;
        }

        .third {
            background-color: grey;
        }

        .fourth {
            background-color: grey;
        }
    }

    &.description {
    }
}
</style>
