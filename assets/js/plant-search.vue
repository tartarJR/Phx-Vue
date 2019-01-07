<template>
    
    <div>

        <div class="form-group">

            <label for="name">Name</label>

            <input type="text" class="form-control" id="name" placeholder="Name" v-model="name">

        </div>

        <div class="form-group">

            <label for="start-date">Start Date</label>

            <input type="text" class="form-control" id="start-date" placeholder="Start Date" v-model="startDate">

        </div>

        <div class="form-group col-3">

            <label for="end-date">End Date</label>

            <input type="text" class="form-control" id="end-date" placeholder="End Date" v-model="endDate">
            
        </div>

        <button type="submit" id="search-plant" class="btn btn-primary" v-on:click="searchPlants">Search Plants</button>

        <div id='list-wrapper' class="mt-3" v-if="plants.length > 0">
        
            <h3>Plants Found</h3>

            <table class="table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="plant in plants" :key="plant.id">
                        <td>{{ plant.name }}</td>
                        <td>{{ plant.description }}</td>
                        <td>{{ plant.price_per_day }}</td>
                        <td>Select</td>
                    </tr>
                </tbody>
            </table> 
        
        </div>

        <div class="mt-3" v-else>

            <h3>No plants found</h3>

        </div>

    </div>

</template>

<script>

import axios from "axios";


export default {
    data: function() {
      
      return {
        
        name: "",

        startDate: "",

        endDate: "",
        
        plants: []

      }

    },

    mounted: function() {
    
    },

    methods: {
      
        searchPlants: function() {



        }

    }
}
</script>