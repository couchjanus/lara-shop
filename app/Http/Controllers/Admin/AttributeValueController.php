<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\AttributeValue;
use App\Http\Controllers\Controller;
use App\Contracts\AttributeContract;
use App\Traits\ApiJsonResponse;

class AttributeValueController extends Controller
{
    use ApiJsonResponse;
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
        try {
            $item = new AttributeValue();
            $item->attribute_id = $request->id;
            $item->value        =  $request->value;
            $item->price        =  $request->price;
            $item->save();
            return response()->json($this->successResponse($item,''));
        } catch (\Exception $exception) {
            return response()->json($exception->getMessage());
        }
    }

    public function updateValues(Request $request)
    {
        try {
            $attributeValue = AttributeValue::findOrFail($request->valueId);
            $attributeValue->attribute_id = $request->id;
            $attributeValue->value = $request->value;
            $attributeValue->price = $request->price;
            $attributeValue->save();
            return response()->json($this->successResponse($attributeValue,''));
        } catch (\Exception $exception) {
            return response()->json($exception->getMessage());
        }
    }

    public function deleteValues(Request $request)
    {
        $attributeValue = AttributeValue::findOrFail($request->input('id'));
        $attributeValue->delete();

        return response()->json(['status' => 'success', 'message' => 'Attribute value deleted successfully.']);
    }
}
