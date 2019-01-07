<template>
    
    <div>

        <h3>Order Details</h3>

        <div class="form-group">

            <label class="control-label col-sm-3">Name: {{this.name}}</label>

        </div>

        <div class="form-group">

            <label class="control-label col-sm-3">Description: {{this.description}}</label>

        </div>

        <div class="form-group">
        
            <label class="control-label col-sm-3">Start Date: {{this.startDate}}</label>

        </div>

        <div class="form-group">
        
            <label class="control-label col-sm-3">End Date: {{this.endDate}}</label>

        </div>

        <div class="form-group">
        
            <label class="control-label col-sm-3">Cost: {{cost}}</label>

        </div>

        <router-link :to="{ path: '/'}">Go back</router-link>

    </div>

</template>

<script>

import axios from "axios";


export default {
    data: function() {
      
      return {
        
          plantId: 0,

          name: "",

          description: "",

          startDate: "",

          endDate: "",

          pricePerDay: 0.0

      }

    },

    mounted: function() {
    
        this.plantId = this.$route.params.plant_id

        this.name = this.$route.params.name

        this.description = this.$route.params.description

        this.startDate = this.$route.params.start_date

        this.endDate = this.$route.params.end_date

        this.pricePerDay = this.$route.params.price_per_day

        this.orderPlant()

    },

    methods: {
      
        orderPlant: function() {

            axios.post("/api/order", {start_date: this.startDate, end_date: this.endDate, cost: this.cost, plant_id: this.plantId})
                    .then(response => {
                        this.response = response.data.msg
                    }).catch(error => {
                        console.log(error);
                    });

        }

    },

    computed: {
      
        cost: function () {
        
            var datDiff = Math.abs(new Date(this.startDate).getTime() - new Date(this.endDate).getTime());
            var diffDays = Math.ceil(datDiff / (1000 * 3600 * 24)); 

            return (diffDays + 1) * this.pricePerDay
        
        }

    }

}
</script>