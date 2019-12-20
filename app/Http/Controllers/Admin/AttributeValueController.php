<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\AttributeValue;
use App\Http\Controllers\Controller;
use App\Contracts\AttributeContract;

class AttributeValueController extends Controller
{
    protected $attributeRepository;

    public function __construct(AttributeContract $attributeRepository)
    {
        $this->attributeRepository = $attributeRepository;
    }

    public function getValues(Request $request)
    {
        $attributeId = $request->input('id');
        $attribute = $this->attributeRepository->findAttributeById($attributeId);

        $values = $attribute->values;

        return response()->json($values);
    }

    public function addValues(Request $request)
    {
        // dump($request);
        $item = new AttributeValue();
        $item->attribute_id = $request->id;
        $item->value        =  $request->value;
        $item->price        =  $request->price;
        dump($item);
        $item->save();
        return response()->json($item);
    }

    public function updateValues(Request $request)
    {
        // $attributeValue = AttributeValue::findOrFail($request->valueId);

        $attributeValue = AttributeValue::whereId($request->valueId)->get();
        dump($attributeValue);
  
        // $attributeValue->attribute_id = $request->id;
        // dump($attributeValue->attribute_id);
        // $attributeValue->value = $request->value;
        // dump($attributeValue->value);
        // $attributeValue->price = floatval($request->price);
        // dump($attributeValue->price);
        $item = [
            'attribute_id' => $request->id,
            'value' => $request->value,
            'price' => floatval($request->price)
        ];
        dump($item);
        $attributeValue->update($item);
        // $attributeValue->update([
        //     'attribute_id' => $request->id,
        //     'value' => $request->value,
        //     'price' => floatval($request->price)
        // ]);
        // $attributeValue->save();
        dump($attributeValue);

        // AttributeValue::whereId($request->valueId)->update($request->all());

        return response()->json($attributeValue);
    }

    public function deleteValues(Request $request)
    {
        $attributeValue = AttributeValue::findOrFail($request->input('id'));
        $attributeValue->delete();

        return response()->json(['status' => 'success', 'message' => 'Attribute value deleted successfully.']);
    }
}
