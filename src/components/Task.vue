<template>
  <div class="task" v-bind:class="stateClass">
    <span class="icon-rounded icon-rounded--left" v-on:click.stop="changeTaskState()">&check;</span>
    <span class="icon-rounded icon-rounded--right" v-on:click.stop="deleteTask()">X</span>
    <span>
      <label v-show="!editing" v-text="task.name" v-on:dblclick="editing = true"></label>
      <input class="task-input"
        v-show="editing"
        v-focus="editing"
        v-bind:value="task.name"
        v-on:keyup.enter="doneEdit"
        v-on:keyup.esc="cancelEdit"
        v-on:blur="doneEdit"
        v-click-outside="cancelEdit"
      >
    </span>
  </div>
</template>

<script>
import ClickOutside from 'vue-click-outside';

export default {
  name: 'Task',
  props: {
    task: {
      type: Object,
      required: true,
    }
  },
  directives: {
    ClickOutside,
    focus (el, { value }, { context }) {
      if (value) {
        context.$nextTick(() => {
          el.focus()
        })
      }
    }
  },
  data() {
    return {
      editing: false,
    }
  },
  computed: {
    stateClass() {
      return {
        pending: this.task.pending,
        done: !this.task.pending,
      }
    },
  },
  methods: {
    doneEdit(e) {
      this.editing = false;
      const value = e.target.value.trim();
      console.log(value); // eslint-disable-line      
    },
    cancelEdit(e) {
      e.target.value = this.task.name;
      this.editing = false;
    },
    deleteTask() {
      this.$emit('task-deleted', this.task);
    },
    changeTaskState() {
      this.$emit('task-state-changed', this.task);
    },
  },
}
</script>

<style scoped>
.task {
  box-sizing: border-box;
  width: 280px;
  height: 100px;
  padding: 10px;
  border-radius: 0.3em;
  font-size: 1.2em;
  font-weight: 300;
  cursor: pointer;
  user-select: none;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  transition: .5s;
}

.pending {
  border-left: 8px solid #b73228;
  background-color: #f44336;
}

.done {
  color: #ddd;
  border-left: 8px solid #0a8f08;
  background-color: #4caf50;
  text-decoration: line-through;
}

.icon-rounded {
  box-sizing: border-box;
  position: absolute;
  top: 10px;
  border-radius: 50%;
  height: 20px;
  width: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 0.8em;
  font-weight: bold;
  cursor: pointer;
  transition: .5s;
}

.icon-rounded--left {
  left: 10px;
}

.icon-rounded--right {
  right: 10px;
}

.pending .icon-rounded {
  background-color: #b73229;
}

.done .icon-rounded {
  background-color: #0a8f08;
}

.task-input {
  outline: none;
  border: none;
  background-color: transparent;
  padding: 5px;
}

.task-input.editing {
  background-color: rgba(255, 255, 255, .5);
  box-shadow: 0 0 20px 5px rgba(255, 255, 255, .1);
}
</style>
