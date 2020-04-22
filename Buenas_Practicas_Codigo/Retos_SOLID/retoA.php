<?php
    //Problema: No respeta el principio de responsabilidad única al tener muchos métodos que no tienen que ver con ordenar.
    //Solución: Dividir en 3 clases distintas.
    class Order
    {
        public function calculateTotalSum(){/*...*/}
        public function getItems(){/*...*/}
        public function getItemCount(){/*...*/}
        public function addItem($item){/*...*/}
        public function deleteItem($item){/*...*/}

        public function printOrder(){/*...*/}
        public function showOrder(){/*...*/}

        public function load(){/*...*/}
        public function save(){/*...*/}
        public function update(){/*...*/}
        public function delete(){/*...*/}
    }
?>