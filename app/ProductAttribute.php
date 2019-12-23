<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductAttribute extends Model
{
    protected $table = 'product_attributes';
    protected $fillable = ['attribute_id', 'product_id', 'value', 'quantity', 'price'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function attribute()
    {
        return $this->belongsTo(Attribute::class);
    }
}
