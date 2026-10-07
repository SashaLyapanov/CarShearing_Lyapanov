<?

if (!defined('B_PROLOG_INCLUDED') || B_PROLOG_INCLUDED !== true) {
    die();
}
?>

    <h2>Список бронирований автомобилей</h2>

<?
if (empty($arResult['ITEMS'])): ?>

    <p>Бронирований нет</p>

<?
else: ?>

    <table border="1" cellpadding="10" cellspacing="0">
        <thead>
        <tr>
            <th>Автомобиль</th>
            <th>Начало брони</th>
            <th>Конец брони</th>
        </tr>
        </thead>

        <tbody>
        <?
        foreach ($arResult['ITEMS'] as $item): ?>

            <tr>
                <td>
                    <?= htmlspecialcharsbx($item['CAR_NAME']) ?>
                </td>

                <td>
                    <?= htmlspecialcharsbx($item['UF_DATE_START']) ?>
                </td>

                <td>
                    <?= htmlspecialcharsbx($item['UF_DATE_END']) ?>
                </td>
            </tr>

        <?
        endforeach; ?>

        </tbody>
    </table>

<?
endif; ?>