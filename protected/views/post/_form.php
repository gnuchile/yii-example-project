<?php
/* @var $this PostController */
/* @var $model Post */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'post-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'titulo'); ?>
		<?php echo $form->textField($model,'titulo',array('size'=>60,'maxlength'=>120)); ?>
		<?php echo $form->error($model,'titulo'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'contenido'); ?>
		<?php echo $form->textArea($model,'contenido',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'contenido'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'fecha_creacion'); ?>
		<?php 
//             echo $form->textField($model,'fecha_creacion');
    $this->widget('zii.widgets.jui.CJuiDatePicker', array(
            'name'=>'Post[fecha_creacion]',
            'value'=>$model->getFecha(),//!$model->isNewRecord ? $model->fecha_creacion : '',
            // additional javascript options for the date picker plugin
            'options'=>array(
                'showAnim'=>'fold',
                'changeMonth'=>true,
                'changeYear'=>true,
                'dateFormat'=>'yy-mm-dd',
            ),
            'language'=>'es',
            'htmlOptions'=>array(
                'style'=>'height:20px;',
                'readonly'=>true,
            ),
        ));
        ?>
		<?php echo $form->error($model,'fecha_creacion'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'user_id'); ?>
		<?php 
    //echo $form->textField($model,'user_id'); 
            echo $form->dropDownList($model, 'user_id',
                CHtml::listData(User::model()->findAll(), 'id', 'username'),
                array('prompt'=>'Elija usuario...')
            );
        ?>
		<?php echo $form->error($model,'user_id'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->