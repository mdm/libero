<template>
  <div>
    <div class="bars" :class="strengthClasses">
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
      <span>Password strength: {{description}}</span>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import zxcvbn from "zxcvbn";

export default Vue.extend({
  props: {
    password:{
        type: String,
        required: true
    }
  },
  computed: {
    description: function() {
      switch (this.strength()) {
        case 1: return "Weak";
        case 2: return "Fair";
        case 3: return "Strong";
        case 4: return "Great";
      }
      return "Very weak";
    },
    strengthClasses: function() {
      const classes = {
        weak: false,
        fair: false,
        strong: false,
        great: false
      };

      switch (this.strength()) {
        case 1: classes.weak = true; break;
        case 2: classes.fair = true; break;
        case 3: classes.strong = true; break;
        case 4: classes.great = true; break;
      }

      return classes;
    }
  },
  methods: {
    strength: function() {
      return zxcvbn(this.password).score;
    }
  }
});
</script>

<style scoped lang="scss">
$weak: red;
$fair: orange;
$strong: limegreen;
$great: green;

.bars {
  display: flex;

  div {
    flex-grow: 1;
    height: 0.3rem;
    border: 1px solid grey;
    background-color: white;
    margin: 2px 0 2px 2px;
  }

  div:first-child {
    margin-left: 0;
  }
}

.description {
  display: flex;
  justify-content: flex-start;

  span {
    font-size: 0.5rem;
    color: grey;
  }
}

.weak {
  &.bars {
      .first {
        border-color: $weak;
        background-color: $weak;
      }
  }

  &.description {
    color: $weak;
  }
}

.fair {
  &.bars {
      .first, .second {
        border-color: $fair;
        background-color: $fair;
      }
  }

  &.description {
    color: $fair;
  }
}

.strong {
  &.bars {
      .first, .second, .third {
        border-color: $strong;
        background-color: $strong;
      }
  }

  &.description {
    color: $strong;
  }
}

.great {
  &.bars {
      .first, .second, .third, .fourth {
        border-color: $great;
        background-color: $great;
      }
  }

  &.description {
    color: $great;
  }
}
</style>
