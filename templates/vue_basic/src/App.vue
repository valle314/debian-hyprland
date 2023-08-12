<script setup>
    import HelloWorld from './components/HelloWorld.vue'
</script>

<template>
    <div class="main-container">
            Lorem ipsum, dolor sit amet consectetur adipisicing elit. 
        <HelloWorld/>
    </div>
</template>

<style scoped lang="scss">
.main-container
{
    font-family: "Computer Modern";
    font-size: $font-size;

    background-color: $background-color;
    color: $text-color;
    
    position: relative;
    padding: 0;
    margin: 0;
    height: 100vh;
}
</style>
