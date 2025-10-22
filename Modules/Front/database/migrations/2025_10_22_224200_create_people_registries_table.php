<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('people_registries', function (Blueprint $table) {
            $table->id();
            $table->string('dni');
            $table->string('name');
            $table->string('last_name');
            $table->string('cuil');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('people_registries');
    }
};
